import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Random;

public class Deploy {
	   public static void main(String[] args) {
	      int x=0,sw=0,tt=0;
	      int batch[] = new int[100];
	      String namee[] = { "채경주", "유동근", "구은정", "조원준", "김진영", "박선미", "윤운영", "김홍욱", "이승진", "라지현", "이창룡", "이세은", "김정목",
	            "최성환", "최윤정", "김승일", "김선민", "박기윤", "김영균","ㅁㅁㅁ" };
	      
	      Random rand = new Random();
	      do {
	         int p = rand.nextInt(namee.length);
	         for(int i=0;i<x;i++) {
	            if (p == batch[i]) {sw = 1;} 
	         }
	         if (sw !=1) {
	            batch[x] = p;
	            x++;
	         }
	         sw=0;
	      } while(x!=namee.length);
	      
	      for (int i=0;i<namee.length;i++) {
	         if (i%4 == 0) {tt++; System.out.print(tt+"조 : ");}; 
	         System.out.print(namee[batch[i]]+ "  ");
	         if (i%4 == 3) System.out.println("");
	      }
	   }

	}