import java.util.Arrays;
import java.util.List;

public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ShuffleSeats sf = new ShuffleSeats(5, 3);
		
		sf.add(0, 0, "����00");
		sf.add(0, 1, "����01");
		sf.add(0, 2, "����02");
		
		sf.add(1, 0, "ȫ��10");
		sf.add(1, 1, "����11");
		sf.add(1, 2, "��ȯ12");
		
		sf.add(2, 0, "����20");
		sf.add(2, 1, "����21");
		sf.add(2, 2, "����22");
		
		sf.add(3, 0, "�30");
		sf.add(3, 1, "����31");
		sf.add(3, 2, "����32");
		
		sf.add(4, 0, "����40");
		sf.add(4, 1, "����41");
		sf.add(4, 2, "â��42");
		
		sf.printe();
		System.out.println("---------------------------------------------------------------------------");
		sf.shuffle();
		sf.printe();
		
		List<Seat> seat = Arrays.asList(sf.getSeats());
	}

}
