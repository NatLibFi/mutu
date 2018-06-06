/*
 * Copyright 2018 University Of Helsinki (The National Library Of Finland)
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 *   
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package fi.nationallibrary.mutu;

/**
 * MutuLogger object
 * 
 * MutuLogger handles outputting of debug, info and error messages.<BR>
 * By default debug messages are not printed. 
 * <P>
 * TODO: consider output using logging framework
 *
 */
public class MutuLogger {
	
	/**
	 * true if debugging is enable
	 */
	private boolean debug = false;
    
    /**
     * Tells if debugging is enabled.
     * 
     * @return true if debugging is enabled.
     */
    public boolean isDebugEnabled(){
        return debug;
    }
    
    /**
     * Enables or disables debugging.
     * 
     * @param val true to enable debug messages
     */
    public void setDebug(boolean val){
        debug = val;
    }
    
    /**
     * Prints informational message.
     * 
     * @param o Object containing message with .toString() method.
     */
    public void info(Object o){
        System.out.println(o.toString());
    }
	
    /**
     * Prints debug message if debug messages are enabled.
     * 
     * @param o Object containing message with .toString() method.
     */
    public void debug(Object o){
    	if(debug) {
    		System.out.println(o.toString());
    	}
    }
    
    /**
     * Prints error message.
     * 
     * @param o Object containing message with .toString() method.
     */
    public void error(Object o){
    	
    	System.out.println(o.toString());
    }    
}
