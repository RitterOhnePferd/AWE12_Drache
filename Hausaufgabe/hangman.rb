 #!/usr/bin/env ruby
 
 class Hangman 
 
	#constructor
	def initialize(sRateword)
		@sRateword = sRateword;
		@sTargetword = initializeblank();
		@iCount =0;
	end
	
	#returns a String with  sRateword.size "-"s
	def initializeblank		
		return "-" *@sRateword.size;
	end

	# returns array of index positions for all characters 'c' found
	def indexPosRatewordContains(c)
		array = Array.new;
		for i in 0...@sRateword.size do
			if(@sRateword[i]==c)
				array<<i;
			end
		end
		return array;
	end
	
	#replaces "-" in targetword by read char
	def replaceby(index, c)
		for i in 0...index.size() do
			@sTargetword[index[i]]=c;
		end
	end
	
	#checks if targetword contains "-"
	def checkblank()
		if(@sTargetword.include? "-")
			return true;
		end
		return false;
	end
	
	#class (program) main logic
	def start
		puts "----HANGMAN----";

		puts "Start?";
		c = gets.chomp[0];
		if(c == "t")
			testAll();
			return
		end

		while(checkblank())
			@iCount+=1; 
			c = gets.chomp[0];;
			index = indexPosRatewordContains(c);
			replaceby(index, c);
			puts @sTargetword;
		end
		puts "Gesuchtes Wort gefunden! Und das mit nur #{@iCount} Versuchen!";
	end

	
	#TDD
	def testAll()
		if (
			indexPosRatewordContainsTest() &&
			replacebyTest() &&
			checkblankTest()
		   )
			puts "Test erfolgreich!"
		else
			puts "Test fehlgeschlagen."
		end
	end

	def indexPosRatewordContainsTest()
		@sRateword = "Test123Test"
		arrReturned = indexPosRatewordContains("e")
		if (arrReturned == [1,8])
			return true;
		end
		return false;	
	end

	def replacebyTest()
		@sTargetword = "Hello"
		replaceby([1], "a")
		if(@sTargetword == "Hallo")
			return true;
		end
		return false;
	end

	def checkblankTest()
		@sTargetword = "He-__-llo Wo-__-rld"
		if checkblank()
			return true;
		end
		return false;
	end

end

#"main"
Hangman.new("wolkenkratzer").start
