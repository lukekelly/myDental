/**
 * Author   : Luke Kelly
 */

package stores;

public class LoggedIn {
    boolean loggedin=false;
    String Username=null;
    @SuppressWarnings("unused")
	private String username;
    
    public LoggedIn(){}
 
    public void setUsername(String username){
        this.Username=username;
    }
    public String getUsername(){
        return Username;
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
    
    public void setUser (String username)
    {
    	this.username=username;
    }
}