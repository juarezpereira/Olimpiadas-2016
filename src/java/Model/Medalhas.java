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
public class Medalhas {
    
    private int id;
    private String pais;
    private int ouro;
    private int prata;
    private int bronze;
    private int esporte;
    private int total;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOuro() {
        return ouro;
    }

    public void setOuro(int ouro) {
        this.ouro = ouro;
    }

    public int getPrata() {
        return prata;
    }

    public void setPrata(int prata) {
        this.prata = prata;
    }

    public int getBronze() {
        return bronze;
    }

    public void setBronze(int bronze) {
        this.bronze = bronze;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public int getEsporte() {
        return esporte;
    }

    public void setEsporte(int esporte) {
        this.esporte = esporte;
    }
    
    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    public static Medalhas getDefault(){
        Medalhas aux = new Medalhas();
        aux.setBronze(0);
        aux.setOuro(0);
        aux.setPrata(0);
        aux.setTotal(0);
        return aux;
    }

}
