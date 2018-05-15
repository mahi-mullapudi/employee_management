package com.tutorialq.utils;

import com.tutorialq.constants.ApplicationConstants;
import org.springframework.stereotype.Component;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Component
public class AuthenticationUtils {

    /**
     * Apply hashing algorithm based on the SALT value and returns the hashed String.
     *
     * @param password
     * @return
     * @throws Exception
     */
    public String getHashValue(String password) throws Exception {
        String saltedPassword = ApplicationConstants.SALT + password;
        String hashedPassword = generateHash(saltedPassword);

        return hashedPassword;
    }

    /**
     * Method to generate Hash value for a given input String.
     *
     * @param input
     * @return
     * @throws Exception
     */
    public static String generateHash(String input) throws Exception {
        StringBuilder hash = new StringBuilder();

        try {
            MessageDigest sha = MessageDigest.getInstance("SHA-1");
            byte[] hashedBytes = sha.digest(input.getBytes());
            char[] digits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                    'a', 'b', 'c', 'd', 'e', 'f'};
            for (int idx = 0; idx < hashedBytes.length; ++idx) {
                byte b = hashedBytes[idx];
                hash.append(digits[(b & 0xf0) >> 4]);
                hash.append(digits[b & 0x0f]);
            }
        } catch (NoSuchAlgorithmException e) {
            throw e;
        }

        return hash.toString();
    }

}
