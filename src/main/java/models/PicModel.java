package models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.utils.Bytes;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Date;
import java.util.UUID;
import javax.imageio.ImageIO;
import static org.imgscalr.Scalr.*;
import org.imgscalr.Scalr.Method;

import lib.*;
import stores.*;

public class PicModel {

    Cluster cluster;

    public void PicModel() {

    }

    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

    public void insertPic(byte[] b, String type, String name, String user, String caption, int flags) {
        try {
            Convertors convertor = new Convertors();

            flags = 0;
            String types[] = Convertors.SplitFiletype(type);
            ByteBuffer buffer = ByteBuffer.wrap(b);
            int length = b.length;
            java.util.UUID picid = convertor.getTimeUUID();

            //The following is a quick way of doing this, will fill the disk quickly !
            Boolean success = (new File("/var/tmp/myDental/")).mkdirs();
            FileOutputStream output = new FileOutputStream(new File("/var/tmp/myDental/" + picid));

            output.write(b);
            byte[] thumbb = picresize(picid.toString(), types[1]);
            int thumblength = thumbb.length;
            ByteBuffer thumbbuf = ByteBuffer.wrap(thumbb);
            byte[] processedb = picdecolour(picid.toString(), types[1]);
            ByteBuffer processedbuf = ByteBuffer.wrap(processedb);
            int processedlength = processedb.length;
            Session session = cluster.connect("myDental");

            PreparedStatement psInsertPic = session.prepare("insert into pics (picid, image, thumb, processed, user, interaction_time, imagelength, thumblength, processedlength, type, name) values(?,?,?,?,?,?,?,?,?,?,?)");
            PreparedStatement psInsertPicToUser = session.prepare("insert into userpiclist ( picid, user, pic_added, caption) values(?,?,?,?)");
            PreparedStatement psInsertFlags = session.prepare("insert into flags (flags,login,picid) values(?,?,?)");

            BoundStatement bsInsertPic = new BoundStatement(psInsertPic);
            BoundStatement bsInsertPicToUser = new BoundStatement(psInsertPicToUser);
            BoundStatement bsInsertFlags = new BoundStatement(psInsertFlags);

            Date DateAdded = new Date();
            session.execute(bsInsertPic.bind(picid, buffer, thumbbuf, processedbuf, user, DateAdded, length, thumblength, processedlength, type, name));
            session.execute(bsInsertPicToUser.bind(picid, user, DateAdded, caption));
            session.execute(bsInsertFlags.bind(flags, user, picid.toString()));

            session.close();

        } catch (IOException ex) {
            System.out.println("Error --> " + ex);
        }
    }

    public byte[] picresize(String picid, String type) {
        try {
            BufferedImage BI = ImageIO.read(new File("/var/tmp/myDental/" + picid));
            BufferedImage thumbnail = createThumbnail(BI);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(thumbnail, type, baos);
            baos.flush();

            byte[] imageInByte = baos.toByteArray();
            baos.close();
            return imageInByte;
        } catch (IOException et) {

        }
        return null;
    }

    public byte[] picdecolour(String picid, String type) {
        try {
            BufferedImage BI = ImageIO.read(new File("/var/tmp/myDental/" + picid));
            BufferedImage processed = createProcessed(BI);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(processed, type, baos);
            baos.flush();
            byte[] imageInByte = baos.toByteArray();
            baos.close();
            return imageInByte;
        } catch (IOException et) {

        }
        return null;
    }

    public static BufferedImage createThumbnail(BufferedImage img) {
        img = resize(img, Method.SPEED, 500, OP_ANTIALIAS);
        return pad(img, 2);
    }

    public static BufferedImage createProcessed(BufferedImage img) {
        int Width = img.getWidth();
        img = resize(img, Method.SPEED, Width, OP_ANTIALIAS);
        return pad(img, 2);
    }

    public void writeFlags(String login, String picid, int flags) {
        Session session = cluster.connect("myDental");

        PreparedStatement ps = session.prepare("insert into flags (login,picid,flags) values(?,?,?)");
        BoundStatement bs = new BoundStatement(ps);
        session.execute(bs.bind(login, picid, flags));
    }

    public int getFlagsForPic(String picid) {
        int flags = 0;
        Session session = cluster.connect("myDental");
        PreparedStatement ps = session.prepare("select login,flags from flags where picid=?  ALLOW FILTERING");
        BoundStatement boundStatement = new BoundStatement(ps);
        ResultSet rs = null;
        rs = session.execute(boundStatement.bind(picid));

        if (rs.isExhausted()) {
            System.out.println("No Flags Yet.");
            return 0;
        } else {
            for (Row row : rs) {
                flags = row.getInt("flags");
            }
        }

        return flags;
    }

    public java.util.LinkedList<Pic> getPicsForUser(String User) {
        java.util.LinkedList<Pic> Pics = new java.util.LinkedList<>();
        Session session = cluster.connect("myDental");
        PreparedStatement ps = session.prepare("select picid,caption from userpiclist where user =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        User));

        //session.close();
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return null;
        } else {
            for (Row row : rs) {
                Pic pic = new Pic();
                java.util.UUID UUID = row.getUUID("picid");
                System.out.println("UUID" + UUID.toString());
                pic.setCaption(row.getString("caption"));
                pic.setUUID(UUID);
                Pics.add(pic);

            }
        }

        return Pics;
    }

    public Pic getPic(int image_type, java.util.UUID picid) {
        Session session = cluster.connect("myDental");
        ByteBuffer bImage = null;
        String type = null;
        int length = 0;
        try {
            Convertors convertor = new Convertors();
            ResultSet rs = null;
            PreparedStatement ps = null;

            if (image_type == Convertors.DISPLAY_IMAGE) {

                ps = session.prepare("select image,imagelength,type,title from pics where picid =?");
            } else if (image_type == Convertors.DISPLAY_THUMB) {
                ps = session.prepare("select thumb,imagelength,thumblength,type,title from pics where picid =?");
            } else if (image_type == Convertors.DISPLAY_PROCESSED) {
                ps = session.prepare("select processed,processedlength,type,title from pics where picid =?");
            }
            BoundStatement boundStatement = new BoundStatement(ps);
            rs = session.execute( // this is where the query is executed
                    boundStatement.bind( // here you are binding the 'boundStatement'
                            picid));

            if (rs.isExhausted()) {
                System.out.println("No Images returned");
                return null;
            } else {
                for (Row row : rs) {
                    if (image_type == Convertors.DISPLAY_IMAGE) {
                        bImage = row.getBytes("image");
                        length = row.getInt("imagelength");
                    } else if (image_type == Convertors.DISPLAY_THUMB) {
                        bImage = row.getBytes("thumb");
                        length = row.getInt("thumblength");

                    } else if (image_type == Convertors.DISPLAY_PROCESSED) {
                        bImage = row.getBytes("processed");
                        length = row.getInt("processedlength");
                    }

                    type = row.getString("type");

                }
            }
        } catch (Exception et) {
            System.out.println("Can't get Pic" + et);
            return null;
        }
        session.close();
        Pic p = new Pic();
        p.setPic(bImage, length, type);

        return p;

    }

    public void insertComment(String username, UUID picID, String comment) {
        Convertors convertor = new Convertors();
        java.util.UUID commentID = convertor.getTimeUUID();
        Date dateCreated = new Date();

        Session session = cluster.connect("myDental");
        PreparedStatement psInsertComment = session.prepare("insert into comments (comment_id, pic_id, user, date_created, content) values(?,?,?,?,?)");
        BoundStatement bsInsertComment = new BoundStatement(psInsertComment);
        session.execute(bsInsertComment.bind(commentID, picID, username, dateCreated, comment));

        session.close();
    }

    public java.util.LinkedList<Comment> getPicComments(java.util.UUID picID) {
        Session session = cluster.connect("myDental");
        PreparedStatement ps = session.prepare("select comment_id, user, date_created, content from comments where pic_id = ?");
        BoundStatement boundStatement = new BoundStatement(ps);
        ResultSet rs = session.execute(boundStatement.bind(picID));
        session.close();

        java.util.LinkedList<Comment> comments = new java.util.LinkedList<>();

        if (rs.isExhausted()) {
            System.out.println("No comments found");
            return null;
        } else {
            for (Row row : rs) {
                Comment comment = new Comment();

                java.util.UUID commentID = row.getUUID("comment_id");
                String user = row.getString("user");
                Date dateCreated = row.getDate("date_created");
                String content = row.getString("content");

                comment.setCommentID(commentID);
                comment.setPicID(picID);
                comment.setUser(user);
                comment.setDateCreated(dateCreated);
                comment.setContent(content);

                comments.add(comment);
            }
        }

        return comments;
    }
}
