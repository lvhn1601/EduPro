/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.UserGoogleDto;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;
import consts.IConstants;
import java.io.InputStream;
import java.util.Properties;
import java.util.Random;

/**
 *
 * @author dell
 */
public class Helper {

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(IConstants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", IConstants.GOOGLE_CLIENT_ID)
                        .add("client_secret", IConstants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", IConstants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", IConstants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = IConstants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);

        return googlePojo;
    }

    public static String genRandSixDigit() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }

    public static Properties getPropertiesByFileName(String fileName) {
        Properties properties = new Properties();
        try ( InputStream inputStream = Helper.class.getClassLoader().getResourceAsStream(fileName)) {
            properties.load(inputStream);
        } catch (IOException e) {
            System.out.println(e);
        }
        return properties;
    }

    public static boolean contains(String[] array, String e) {
        if (array == null) {
            array = new String[0];
        }
        for (String a : array) {
            if (a.equals(e)) {
                return true;
            }
        }
        return false;
    }
}
