#Test
@chems = ("C6H12O6","CCl2F2","C4H8(OH)2","PbC1(NH3)2(COOH)2");

#Compiled regex thats matches all chemical gropus in challange samples
$matchAll = qr/([A-Z][a-z]*\d*(?=[A-Z]?|\s|\())|(\([A-Z]*\d*\)\d+)/;

#Compiled regex to match encapsulted data
$matchEncap = qr/(\([A-Z]*\d*\)\d+)/;

$i=0;
#Loops through challange data
while ($i < 4) 
{   
   print "$chems[$i]\n";  
   while($chems[$i] ne "")
   {       
        $chems[$i] =~ $matchAll;
        
        $match = "$&";
        $chems[$i] = "$'";    
        
        if($match =~ $matchEncap)
        {
	    while($match ne "")
            {   
                #Gets the number outside the brackets
                @results = split(/\)/, $match);
                $multi = @results[@results-1];
                
                #Outputs for testing
                #print "\n";
                #print "$multi\n";
                #print "\n";
                
                @contents = ($match =~ m/([A-Z][a-z]?\d?)/g);
               
                #This works something out
                foreach $equ (@contents)
                {
                    #Digitridoo
                    if($equ =~ m/\d+/)
                    {
                        $num = $& * $multi;
                        print "$`:$num\n";
                    }
                    else
                    {
                        print "$equ:$multi\n";
                    }              
                }
               $match = "";
            }
        }
        else
        {
            #Same kinda logic as above
            if($match =~ m/\d+/)
            {
                print "$`:$&\n";
            }
            else
            {
                print "$match:1\n";
            }
       }
   }

$i = $i +1;
}
