import java.util.*;
public String[] upperCase = {"A","B","C","D","E","F","G","H","I","J","K","L",
   "M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
public void setup() {
	System.out.println(pigLatin("With"));
  String lines[] = loadStrings("LowellHymn.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) 
  {  
      String temp = "";
    String[] parts = lines[i].split(" ");
    for(int a = 0; a < parts.length;a++)
    {
      parts[a]=pigLatin(parts[a]);
      temp+=parts[a]+" ";
    }
      System.out.println(temp);
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
public boolean findUpperCase(String sWord)
{
  for(int a = 0; a < sWord.length();a++)
  {
    boolean temp = false;
    for(int b= 0; b<upperCase.length;b++)
    {
      if(sWord.substring(a,a+1).equals(upperCase[b]))
      {
        temp = true;
      }
    }
    if(!temp){return false;}
  }
  return true;
}
public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
  String temp = "";
  if(sWord.length()==0){return sWord;}
  boolean firstCap = findUpperCase(sWord.substring(0,1));
  if(firstCap)
  {
    sWord=sWord.substring(0,1).toLowerCase()+sWord.substring(1);
  }
  if(findFirstVowel(sWord) == -1)
  {
   temp= sWord + "ay";
  }
  else if(findFirstVowel(sWord)==0)
  {
    temp= sWord +"way";
  }
  else if(sWord.substring(0,2).equals("qu"))
  {
    temp= sWord.substring(2) +"qu";
  }
  else if(findFirstVowel(sWord) !=0)
  {
    temp= sWord.substring(findFirstVowel(sWord))+
    sWord.substring(0,findFirstVowel(sWord))+"ay";
  }
  else
  {
    return "ERROR!";
  }

  if(firstCap)
  {
    temp=sWord.substring(0,1).toUpperCase()+sWord.substring(1);
  }
  return temp;
}
