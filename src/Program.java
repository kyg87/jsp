import java.util.Arrays;
import java.util.List;

public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ShuffleSeats sf = new ShuffleSeats(5, 3);
		
		sf.add(0, 0, "원준00");
		sf.add(0, 1, "경주01");
		sf.add(0, 2, "선민02");
		
		sf.add(1, 0, "홍욱10");
		sf.add(1, 1, "지현11");
		sf.add(1, 2, "성환12");
		
		sf.add(2, 0, "정목20");
		sf.add(2, 1, "진영21");
		sf.add(2, 2, "기윤22");
		
		sf.add(3, 0, "운영30");
		sf.add(3, 1, "세은31");
		sf.add(3, 2, "선미32");
		
		sf.add(4, 0, "승진40");
		sf.add(4, 1, "동근41");
		sf.add(4, 2, "창룡42");
		
		sf.printe();
		System.out.println("---------------------------------------------------------------------------");
		sf.shuffle();
		sf.printe();
		
		List<Seat> seat = Arrays.asList(sf.getSeats());
	}

}
