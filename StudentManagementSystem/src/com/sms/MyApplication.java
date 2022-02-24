package com.sms;

import java.util.List;
import java.util.Scanner;

import com.sms.dao.StudentDao;
import com.sms.entity.Student;

public class MyApplication {

	private static Scanner sc;

	public static void main(String[] args) {
		sc = new Scanner(System.in);

		System.out.println("********** Welcome to Student Project **********");

		boolean go = true;
		while (go) {
			System.out.println("PRESS 1 for add new Student data");
			System.out.println("PRESS 2 for get single Student data");
			System.out.println("PRESS 3 for all Student data");
			System.out.println("PRESS 4 for update Student");
			System.out.println("PRESS 5 for delete Student");
			System.out.println("PRESS 6 exit");
			try {
				int choice = sc.nextInt();
				switch (choice) {
				case 1:
					// add student
					System.out.println("******************************");
					System.out.println("Enter Student's id :");
					
					int id = sc.nextInt();
					sc.nextLine();
					
					System.out.println("Enter Student's name :");
					String name = sc.nextLine();

					System.out.println("Enter Student's city :");
					String city = sc.nextLine();

					Student s = new Student();
					s.setId(id);
					s.setName(name);
					s.setCity(city);
					int r = StudentDao.insert(s);
					System.out.println(r + " Data Inserted");
					System.out.println("******************************");
					break;
				
				case 2:
					// get single student
					System.out.println("******************************");
					
					System.out.println("Enter Student's id : ");
					int studentId = sc.nextInt();
					
					Student sget = StudentDao.getStudentById(studentId);
					System.out.println("Id : " + sget.getId());
					System.out.println("Name : " + sget.getName());
					System.out.println("City : " + sget.getCity());
					System.out.println("******************************");
					break;

				case 3:
					// get all student

					List<Student> allStudents = StudentDao.getAllStudents();
					for (Student st : allStudents) {
						System.out.println("");
						System.out.println("Id : " + st.getId());
						System.out.println("Name : " + st.getName());
						System.out.println("City : " + st.getCity());

						System.out.println("_____________________________________");
					}
					System.out.println("******************************");

					break;

				case 4:
					// update
					System.out.println("Enter Student's id : ");
					int sId = sc.nextInt();
					Student st = StudentDao.getStudentById(sId);

					sc.nextLine();
					System.out.println("Enter Student's name :");
					String userName = sc.nextLine();

					System.out.println("Enter Student's city :");
					String userCity = sc.nextLine();

					st.setName(userName);
					st.setCity(userCity);
					int status = StudentDao.updateStudent(st);
					System.out.println("Data updated " + status);
					break;
				
				  case 5: 
					  //delete 
					  System.out.println("Enter Student's id : "); 
					  int userId=sc.nextInt(); 
					  StudentDao.deleteStudent(userId);
				  
				  break;
				  case 6:
					go = false;
					break;

				}
			} catch (Exception e) {
				System.out.println("Invalid Input Try with another one!!");
				System.out.println(e.getMessage());
			}

		}

		System.out.println("Thankyou for using my application.");
		System.out.println("see you soon");

	}

}
