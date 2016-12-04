/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author Juarez
 */
public class Usuario implements Serializable{
    
    private int mID;
    private String mNameUser;
    private String mPassword;

    /**
     * @return the mID
     */
    public int getID() {
        return mID;
    }

    /**
     * @param mID the mID to set
     */
    public void setID(int mID) {
        this.mID = mID;
    }

    /**
     * @return the mNameUser
     */
    public String getNameUser() {
        return mNameUser;
    }

    /**
     * @param mNameUser the mNameUser to set
     */
    public void setNameUser(String mNameUser) {
        this.mNameUser = mNameUser;
    }

    /**
     * @return the mPassword
     */
    public String getPassword() {
        return mPassword;
    }

    /**
     * @param mPassword the mPassword to set
     */
    public void setPassword(String mPassword) {
        this.mPassword = mPassword;
    }
    
}
