/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Juarez
 */
public class PaisMedalhas {
    
    private String mNomePais;
    private int mOuro;
    private int mPrata;
    private int mBronze;
    private int mTotalMedalhas;
    
    public PaisMedalhas(){
        this.mTotalMedalhas = 0;
    }

    public String getNomePais() {
        return mNomePais;
    }

    public void setNomePais(String nomePais) {
        this.mNomePais = nomePais;
    }

    public int getOuro() {
        return mOuro;
    }

    public void setOuro(int mOuro) {
        this.mOuro = mOuro;
    }

    public int getPrata() {
        return mPrata;
    }

    public void setPrata(int mPrata) {
        this.mPrata = mPrata;
    }

    public int getBronze() {
        return mBronze;
    }

    public void setBronze(int mBronze) {
        this.mBronze = mBronze;
    }

    public int getTotalMedalhas() {
        return mTotalMedalhas;
    }

    public void setTotalMedalhas(int mTotalMedalhas) {
        this.mTotalMedalhas = mTotalMedalhas;
    }
    
}
