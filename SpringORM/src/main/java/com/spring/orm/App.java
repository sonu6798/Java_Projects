package com.spring.orm;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.spring.orm.dao.StudentDao;
import com.spring.orm.entities.Student;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
       ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("config.xml");
       StudentDao studentDao=context.getBean("studentDao",StudentDao.class);
      
      /* Student s=new Student(1,"Sonu","Delhi");
       int r=studentDao.insert(s);
       System.out.println("done"+r);
       
       	Student sget=studentDao.getStudent(2);
       	System.out.println(sget.getStudentId()+" : "+sget.getStudentName()+" : "+sget.getStudentCity());
       */
       Scanner sc=new Scanner(System.in);
       
       System.out.println("********** Welcome to Spring ORM Project **********");
       
       boolean go=true;
       while(go) {
       System.out.println("PRESS 1 for add new Student data");
       System.out.println("PRESS 2 for get single Student data");
       System.out.println("PRESS 3 for all Student data");
       System.out.println("PRESS 4 for update Student");
       System.out.println("PRESS 5 for delete Student");
       System.out.println("PRESS 6 exit");
       try {
    	   int choice=sc.nextInt();
    	   switch(choice) {
    	   case 1:
    		   //add student
    		   System.out.println("******************************");
    		   System.out.println("Enter user id :");
    		   int id=sc.nextInt();
    		   sc.nextLine();
    		   System.out.println("Enter user name :");
    		   String name=sc.nextLine();
    		   
    		   System.out.println("Enter user city :");
    		   String city=sc.nextLine(); 
    		   
    		   Student s=new Student();
    		   s.setStudentId(id);
    		   s.setStudentName(name);
    		   s.setStudentCity(city);
    		   int r=studentDao.insert(s);
    	       System.out.println(r+" Data Inserted");
    	       System.out.println("******************************");
    		   break;
    	   case 2:
    		   //get single student
    		   System.out.println("******************************");
    		   System.out.println("Enter user id : ");
    		   int studentId=sc.nextInt();
    		   Student sget=studentDao.getStudent(studentId);
    	       	System.out.println("Id : "+sget.getStudentId());
    	       	System.out.println("Name : "+sget.getStudentName());
    	       	System.out.println("City : "+sget.getStudentCity());
    		   System.out.println("******************************");
    		   break;
    	   case 3:
    		   //get all student
    		   
    		   List<Student> allStudents=studentDao.getAllStudents();
    		   for(Student st:allStudents) {
    			   System.out.println("");
    			   System.out.println("Id : "+st.getStudentId());
    			   System.out.println("Name : "+st.getStudentName());
    			   System.out.println("City : "+st.getStudentCity());
    			   System.out.println("_____________________________________");
    		   }
    		   System.out.println("******************************");
    		   
    		   break;
    	   case 4:
    		   //update
    		   int sId=sc.nextInt();
    		   Student st=studentDao.getStudent(sId);
    		   
    		   sc.nextLine();
    		   System.out.println("Enter user name :");
    		   String userName=sc.nextLine();
    		   
    		   System.out.println("Enter user city :");
    		   String userCity=sc.nextLine(); 
    		   
    		   //Student stu=new Student();
    		   st.setStudentName(userName);
    		   st.setStudentCity(userCity);
    		   studentDao.updateStudent(st);
    		   
    		   break;
    	   case 5:
    		   //delete
    		   System.out.println("Enter user id : ");
    		   int userId=sc.nextInt();
    		   studentDao.deleteStudent(userId);
    		   System.out.println("Student Data Deleted.");
    		   
    		   break;
    	   case 6:
    		   go=false;
    		   break;

    	   }
    	   }catch(Exception e) {
    	   System.out.println("Invalid Input Try with another one!!");
    	   System.out.println(e.getMessage());
       }
       
       }
       
       System.out.println("Thankyou for using my application.");
	   System.out.println("see you soon");
	   
    }
}
