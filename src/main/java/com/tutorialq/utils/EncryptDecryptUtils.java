package com.tutorialq.utils;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class EncryptDecryptUtils {

    private static final String ALGORITHM = "AES/CBC/PKCS5PADDING";
    private static final String ALGORITHM_AES = "AES";
    private static final String ENCODING = "UTF-8";

    /**
     * Returns an encrypted value from a given String value, encrypt/encode it
     * into an URL safe String. This method uses AES algorithm for encryption
     * and Apache Base64 class to encode it into URL safe String from byte
     * array.
     *
     * @param key        --- This key is a 16byte String parameter. In ECAS it is
     *                   created using Apache RandomUtils method and is stored in the session. So
     *                   the key will be different for each session.
     * @param initVector --- This initVector is a 16byte String parameter. In
     *                   ECAS it is a constant that is maintained in each controller.
     * @param value      --- This is the input value that will be encrypted.
     * @return
     * @throws Exception
     */
    public String encrypt(String key, String initVector, String value) throws Exception {
        log.debug("Inside the encrypt method of EncryptDecryptService");
        try {
            IvParameterSpec iv = new IvParameterSpec(initVector.getBytes(ENCODING));
            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(ENCODING), ALGORITHM_AES);

            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);

            byte[] encrypted = cipher.doFinal(value.getBytes());
            log.info("Encrypted string: " + Base64.encodeBase64URLSafeString(encrypted));

            return Base64.encodeBase64URLSafeString(encrypted);
        } catch (UnsupportedEncodingException | InvalidAlgorithmParameterException | InvalidKeyException | NoSuchAlgorithmException | BadPaddingException | IllegalBlockSizeException | NoSuchPaddingException ex) {
            log.error("Error while encryption: " + ex);
            throw ex;
        }

    }

    /**
     * Returns a decrypted String value for a given encrypted value. This method
     * uses AES algorithm for encryption/decryption and Apache Commons Codec
     * Base64 class to decode it into a byte array.
     *
     * @param key---     This key is a 16byte String parameter. In ECAS it is
     *                   created using Apache RandomUtils method and is stored in the session. So
     *                   the key will be different for each session.
     * @param initVector --- This initVector is a 16byte String parameter. In
     *                   ECAS it is a constant that is maintained in each controller.
     * @param encrypted  --- This is the encrypted value that will be decrypted.
     * @return
     * @throws Exception
     */
    public String decrypt(String key, String initVector, String encrypted) throws Exception {
        try {
            IvParameterSpec iv = new IvParameterSpec(initVector.getBytes(ENCODING));
            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(ENCODING), ALGORITHM_AES);

            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);

            byte[] original = cipher.doFinal(Base64.decodeBase64(encrypted));
            log.info("Decrypted string: " + original);

            return new String(original);
        } catch (UnsupportedEncodingException | InvalidAlgorithmParameterException | InvalidKeyException | NoSuchAlgorithmException | BadPaddingException | IllegalBlockSizeException | NoSuchPaddingException ex) {
            log.error("Error while decryption: " + ex);
            throw ex;
        }

    }

    /**
     * Encode the inputString to a URL safe string
     *
     * @param inputString
     * @return
     */
    public String encodeInputString(String inputString) {
        String encodedOutput = "";
        if (StringUtils.isNotBlank(inputString)) {
            encodedOutput = Base64.encodeBase64URLSafeString(inputString.getBytes());
        }
        return encodedOutput;
    }

    /**
     * Decode the inputString from Base64
     *
     * @param inputString
     * @return
     */
    public String decodeInputString(String inputString) {
        String decodedOutput = "";
        if (StringUtils.isNotBlank(inputString)) {
            decodedOutput = new String(Base64.decodeBase64(inputString));
        }
        return decodedOutput;
    }

}
