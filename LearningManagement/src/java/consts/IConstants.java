/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package consts;

/**
 *
 * @author dell
 */
public interface IConstants {

    String GOOGLE_CLIENT_ID = "582482724683-agpkpopgmr0tghn7nlhalfve4t1aa9k0.apps.googleusercontent.com";

    String GOOGLE_CLIENT_SECRET = "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";

    String GOOGLE_REDIRECT_URI = "http://localhost:9999/LearningManagement/sign-in";

    String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    String GOOGLE_GRANT_TYPE = "authorization_code";

    String GOOGLE_LOGIN_HREF = "https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:9999/LearningManagement/sign-in&response_type=code&client_id=582482724683-agpkpopgmr0tghn7nlhalfve4t1aa9k0.apps.googleusercontent.com&approval_prompt=force";

}
