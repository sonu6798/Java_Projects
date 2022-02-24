package com.spring.jdbc;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.spring.jdbc.dao.StudentDao;
import com.spring.jdbc.entities.Student;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Ready" );
       /*
        // Configuration using xml file
        ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("config.xml");
        */
        
        // Configuration using java file
        AnnotationConfigApplicationContext context =new AnnotationConfigApplicationContext(JdbcConfig.class);
        
        StudentDao studentDao=context.getBean("studentDao",StudentDao.class);
       
        //insert data
        
        Student student=new Student();
        student.setId(4);
        student.setName("John");
        student.setCity("Lucknow");
       int result= studentDao.insert(student);
       System.out.println("Data inserted... "+result);
  		
       
        
        /*
        //update
        Student student1=new Student();
        student1.setId(1);
        student1.setName("Sonu");
        student1.setCity("Patna");
        int result=studentDao.change(student1);        
        System.out.println("Data updated... "+result);
   		*/
        
        /*
         // delete
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter id here for delete operation : ");
        int id=sc.nextInt();
        int result=studentDao.delete(id);        
        System.out.println("Record Delete"+result);
   		*/
       
        /*
        //fetch single data
        Student student=studentDao.fetch(1);
        System.out.println(student);
        */
        
        //fetch all data
        List<Student> student1=studentDao.getAllStudent();
        for(Student s:student1) {
        	System.out.println(s);
        }
    }
}
