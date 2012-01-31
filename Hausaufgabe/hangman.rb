 #!/usr/bin/env ruby
 
 class Hangman 
 
	#constructor
	def initialize(sRateword)
		@sRateword = sRateword;
		@targetword = initializeblank();
		@count =0;
	end
	
	#some method declarations
	
	#returns a String with  sRateword.size "-"s
	def initializeblank		
		return "-" *@sRateword.size;
	end
	 
	#reads first letter from keyboard 
	def readfirstletter() 
		return gets.chomp[0];
	end

	# returns index of searched charakter in searched word
	def indexsRatewordcontains(c)
		array = Array.new;
		for i in 0..@sRateword.size-1 do
			if(@sRateword[i]==c)
				array<<i;
			end
		end
		return array;
	end
	
	#replaces "-" in targetword by read char
	def replaceby(index, c)
		for i in 0..index.size()-1 do
			@targetword[index[i]]=c;
		end
	end
	
	#checks if targetword contains "-"
	def checkblank()
		if(@targetword.include? "-")
			return true;
		end
		return false;
	end
	
	#this is where the magic happens
	def start
		puts("----HANGMAN----");
		while(checkblank())
			@count+=1; 
			c = readfirstletter();
			index =indexsRatewordcontains(c);
			replaceby(index, c);
			puts @targetword;
		end
		puts "Gesuchtes Wort gefunden! Und das mit nur #{@count} Versuchen!"
	end
end

#"main"
Hangman.new("wolkenkratzer").start
