
public class Number02
{

	public static void main(String[] args)
	{
		int fSum = 0;
		for(int i = 0; i <= 1000; i++)
		{
			if(!(i % 2 == 0 && i % 5 ==0) && (i % 2 == 0 || i % 5 == 0))
			{
				fSum = fSum + i;
			}			
		}		
		System.out.println("(for문)sum = " + fSum);
		
		int i = 0;
		int wSum = 0;
		while(i <= 1000)
		{
			if(i % 2 == 0 && i % 5 == 0)
			{
				i++;
				continue;
			}
			if(i % 2 == 0 || i % 5 == 0)
			{
				wSum = wSum + i ;
			}
			i++;
		}
		System.out.println("(while)sum = " + wSum);
	}

}
