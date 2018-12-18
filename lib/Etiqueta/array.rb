class Array

 def ordenar_con_for
    @temp=self.map{|x| x}
    lista_ordenada=[]
    lista_ordenada.push(@temp[0])
    for i in (1..self.size-1)
	a=@temp[i]
	for j in (0..i)
	    if(lista_ordenada[j]>=a)
		lista_ordenada.insert(j,a)
	        break
	    elsif(lista_ordenada[(lista_ordenada.size)-1] <= a)
	  	lista_ordenada.push(a)
		break
	    end
	end
     end
   return lista_ordenada     	
end


def ordenar_con_each
        
        @temp  = self.map{ |x| x}
	lista_ord=[]
	i=0
	@temp.each do |x|
            a=x
            i1=i
	    j=i1+1
  	    @temp[j..@temp.length-1].each do |y|  
  	      if a > y
    		 a = y
    		 i1 = j
              end
              j+=1
  	      end
  	    @temp[i1]=x
            @temp[i]=a
	    i+=1
          end
      @temp
end
end

