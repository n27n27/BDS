import java.time.LocalDate;

public class Number01
{

	public static void main(String[] args)
	{
		int year = 1982;
		int age;
		
		LocalDate today = LocalDate.now();
		
		age = today.getYear() - year;
		System.out.printf("%d년 %d살", year, age);
	}

}
