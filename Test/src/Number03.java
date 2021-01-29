
public class Number03
{	
	String name;
	String account;
	int balance;
	
	public Number03(String name, String account, int balance)
	{
		this.name = name;
		this.account = account;
		this.balance = balance;
	}	
	public void deposit(int money)
	{
		balance = balance + money;
		System.out.println("입금액: " + money);
		System.out.println("잔액: " + balance);
	}	
	public void withdraw(int money)
	{
		if(money > balance)
		{
			System.out.println("잔액이 부족합니다.");
			return;
		}
		
		balance = balance - money;
		System.out.println("출금액: " + money);
		System.out.println("잔액: " + balance);		
	}	
	@Override
	public String toString()
	{
		return String.format("예금주: %s, 계좌번호: %s, 잔액: %d", name, account, balance);
	}
}
