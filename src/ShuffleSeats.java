import java.util.ArrayList;
import java.util.List;

public class ShuffleSeats {
	
	private List<Seat> seats;
	public ShuffleSeats(int groupCapa,int seatCapa)
	{
		seats = new ArrayList<Seat>();
	}
	
	public void add(int group,int seatIndex,String userName)
	{
		Seat seat = new Seat();
		
		seat.setGroup(group);
		seat.setIndex(seatIndex);
		seat.setUserName(userName);
		
		seats.add(seat);
	}
	
	public void shuffle()
	{
		
	}
	public List<Seat> getSeats()
	{
		
		return seats;
	}
}
