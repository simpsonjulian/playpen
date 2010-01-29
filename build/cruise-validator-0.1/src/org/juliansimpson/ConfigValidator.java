package org.juliansimpson;

import java.io.File;

import net.sourceforge.cruisecontrol.CruiseControlException;
import net.sourceforge.cruisecontrol.config.XMLConfigManager;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

public class ConfigValidator extends Task {
	public String configFile;

	public void execute() throws BuildException {
		try {
			File file = new File(configFile);
			new XMLConfigManager(file);
		} catch (CruiseControlException e) {
			e.printStackTrace();
			throw new BuildException("Invalid CruiseControl Config");
		} 
	}
	
	public void setConfigFile(String config) {
		configFile = config;
	}

}
