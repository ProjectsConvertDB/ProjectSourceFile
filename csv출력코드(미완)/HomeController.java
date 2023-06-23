package org.momento.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws IOException{
		logger.info("File Reader.", locale);
		
		FileReader filereader = new FileReader("C://test/test.csv");
		
		FileReader_1 csvReader = new FileReader_1();
		
		model.addAttribute("csvread", csvReader.readCSV());
		
		return "main";
	}
	
}
