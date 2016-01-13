import java.util.*;

public void setup() {
	String lines[] = loadStrings("LowellHymn.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{	
		String[] parts = lines[i].split(" ");
		for(int a = 0; a < parts.length;a++)
		{
			parts[a]=pigLatin(parts[a]);
		}
		System.out.println(parts[1]);
	 	//System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
String[] searchVowels = {"a","e","i","o","u","A","E","I","O","U"};
   for(int a  = 0; a < sWord.length();a++)
  {
      for(int b= 0; b<searchVowels.length;b++)
      {
         if(sWord.substring(a,a+1).equals(searchVowels[b]))
         {
         return a;
         }
      }
  }
  return -1;
}
public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	else if(findFirstVowel(sWord)==0)
	{
		return sWord +"way";
	}
	else if(sWord.substring(0,2).equals("qu"))
	{
		return sWord.substring(2) +"qu";
	}
	else if(findFirstVowel(sWord) !=0)
	{
		return sWord.substring(findFirstVowel(sWord))+
		sWord.substring(0,findFirstVowel(sWord))+"ay";
	}
	else
	{
		return "ERROR!";
	}
}
//use split the function to seperate the big chunks of line into smaller lines and use pig latin to 
//translate from that, after that the translated text will be put back together
//
