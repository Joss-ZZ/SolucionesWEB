package modelo;


import java.security.SecureRandom;
import java.util.UUID;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author PCGAMING
 */
public class token {
    

    public static String generateString() {
        String token = UUID.randomUUID().toString();
        return token;
    }
        

}
