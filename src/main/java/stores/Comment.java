/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stores;

import java.util.Date;
import java.util.UUID;

/**
 *
 * @author Luke
 */
public class Comment {
    private UUID commentID = null;
    private UUID picID = null;
    private String user = null;
    private String firstname = null;
    private Date dateCreated = null;
    private String content = null;
    private int flag = 0;
    
    public Comment(){
        
    }

    public UUID getCommentID() {
        return commentID;
    }

    public void setCommentID(UUID commentID) {
        this.commentID = commentID;
    }

    public UUID getPicID() {
        return picID;
    }

    public void setPicID(UUID picID) {
        this.picID = picID;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
    
       public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
