/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dao.ClientDao;
import entities.Client;
import java.util.List;

/**
 *
 * @author Sara
 */
public class TestClients {

    public static void main(String[] args) {
        ClientDao cd = new ClientDao();
        List<Client> clients = cd.findClientsByNomCompetence("Communication interpersonnelle");
        if (clients != null) {
            for (Client c : clients) {
                System.out.println(" - " + c.getNom() + " " + c.getPrenom() + "\n - " + c.getCin());
            }
        } else {
            System.out.println("Aucun client trouvé.");
        }
    }
}
