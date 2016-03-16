/**
 * Author   : Luke Kelly
 */

package stores;

public class LoggedIn {
    boolean loggedin=false;
    String Username=null;
    String firstName=null;
    @SuppressWarnings("unused")
    
    public LoggedIn(){}
 
    public void setUsername(String username){
        this.Username=username;
    }
    public String getUsername(){
        return Username;
    }
    
     public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
       public String getFirstName() {
        return firstName;
    }

    public void setLoggedin(){
        loggedin=true;
    }
    public void setLoggedout(){
        loggedin=false;
    }
    
    public void setLoginState(boolean loggedin){
        this.loggedin=loggedin;
    }
    public boolean getloggedin(){
        return loggedin;
    }
}