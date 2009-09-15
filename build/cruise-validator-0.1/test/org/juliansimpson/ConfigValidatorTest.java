/**
 * 
 */
package org.juliansimpson;

import static org.junit.Assert.*;

import org.apache.tools.ant.BuildException;
import org.junit.Before;
import org.junit.Test;
import org.juliansimpson.ConfigValidator;

/**
 * @author jsimpson
 *
 */
public class ConfigValidatorTest {

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
	}

	/**
	 * Test method for {@link org.juliansimpson.ConfigValidator#execute()}.
	 */
	@Test
	public void testShouldPassALegalConfigurationFile() {
		
		try {
			ConfigValidator validator = new ConfigValidator();
			validator.setConfigFile("test/good.xml");
			validator.execute();
		} catch (BuildException e) {
			fail("this should have been valid");
		}
		
	}
	@Test
	public void testShouldFailAGarbageConfigurationFile() {
		
		try {
			ConfigValidator validator = new ConfigValidator();
			validator.setConfigFile("test/garbage.xml");
			validator.execute();
			fail("this should have thrown an exception");
			
		} catch (BuildException e) { }
		
	}
	@Test
	public void testShouldFailNoConfigurationFile() {
		
		try {
			ConfigValidator validator = new ConfigValidator();
			validator.setConfigFile("test/no_such_file.xml");
			validator.execute();
			fail("this should have thrown an exception");
			
		} catch (BuildException e) { }
		
	}

}
