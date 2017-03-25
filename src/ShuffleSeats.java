import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ShuffleSeats {
	
	private Seat[] arraySeat ;
	
	public ShuffleSeats(int groupCapa,int seatCapa)
	{
		arraySeat = new Seat[groupCapa * seatCapa];
	}
	
	public void add(int group,int seatIndex,String userName)
	{
		Seat seat = new Seat();
		
		seat.setGroup(group);
		seat.setIndex(seatIndex);
		seat.setUserName(userName);
		
		arraySeat[(group *3) + seatIndex] = seat;
		
	}
	
	public void shuffle()
	{
		Random random = new Random();
		
		for(int i = 0; i < 5 * 3;i++){
			
			int randomNum = random.nextInt(5 * 3);
		
			Seat temp = new Seat();
			
			temp = arraySeat[i];

			arraySeat[i] = arraySeat[randomNum];

			arraySeat[randomNum] = temp;
	
		}
		
		setSeats();
	}
	
	private void setSeats()
	{
		for(int i = 0; i < 5 * 3;i++){
			arraySeat[i].setSeat(i/3, i%3);
		}
	}
	
	public void printe()
	{
		for(int i = 0; i < 5 * 3;i++){
			
			System.out.printf("%d %d %s \n", arraySeat[i].getGroup(),arraySeat[i].getIndex(),arraySeat[i].getUserName());
			
		}
	}
	
	public Seat[] getSeats()
	{

		return arraySeat;
	}
}
