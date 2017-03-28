import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ShuffleSeats {
	
	private Seat[] arraySeat ;
	
	private int _groupCapa;
	private int _seatCapa;
	
	public ShuffleSeats(int groupCapa,int seatCapa)
	{
		arraySeat = new Seat[groupCapa * seatCapa];
		_groupCapa= groupCapa;
		_seatCapa = seatCapa;
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
		for(int i = 0; i < _groupCapa * _seatCapa;i++){
			arraySeat[i].setSeat(i/_seatCapa, i%_seatCapa);
		}
	}
	
	public void printe()
	{
		for(int i = 0; i < _groupCapa * _seatCapa;i++){
			
			System.out.printf("%d %d %s \n", arraySeat[i].getGroup(),arraySeat[i].getIndex(),arraySeat[i].getUserName());
			
		}
	}
	
	public Seat[] getSeats()
	{

		return arraySeat;
	}
}
