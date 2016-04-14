/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stores;

import com.datastax.driver.core.utils.Bytes;
import java.nio.ByteBuffer;
import java.util.List;

/**
 *
 * @author Luke
 */
public class Pic {

    private ByteBuffer bImage = null;
    private int length;
    private String type;
    private String caption;
    private String sendto;
    private String user;
    private java.util.UUID UUID = null;
    private java.util.List<String> comments = null;

    public void Pic() {

    }

    public List<String> getComments() {
        return comments;
    }

    public void setComments(List<String> comments) {
        this.comments = comments;
    }

    public void setUUID(java.util.UUID UUID) {
        this.UUID = UUID;
    }

    public String getSUUID() {
        return UUID.toString();
    }

    public void setPic(ByteBuffer bImage, int length, String type) {
        this.bImage = bImage;
        this.length = length;
        this.type = type;
    }

    public ByteBuffer getBuffer() {
        return bImage;
    }

    public int getLength() {
        return length;
    }

    public String getType() {
        return type;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public String getCaption() {
        return caption;
    }
    
    public void setSendto(String sendto) {
        this.sendto = sendto;
    }

    public String getSendto() {
        return sendto;
    }
    
      public void setUser(String user){
        this.user = user;
    }
    public String getUser(){
        return user;
    }
  

    public byte[] getBytes() {

        byte image[] = Bytes.getArray(bImage);
        return image;
    }

}
