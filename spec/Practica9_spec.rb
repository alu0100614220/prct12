require 'Practica9.rb'

describe Matriz do
before (:each) do
  
  @f1 = Racional.new(1.0,2.0)
  @f2 = Racional.new(2.0,3.0)
  @f3 = Racional.new(5.0,4.0)
  @f4 = Racional.new(3.0,2.0)
  @f5 = Racional.new(7.0,2.0)
#Densas
  @m11 = Matriz.constructor(3, 3, [1,1,1,1,1,1,1,1,1])
  @m12 = Matriz.constructor(3, 3, [2,2,2,2,2,2,2,2,2])
  @m13 = Matriz.constructor(3, 3, [3,3,3,3,3,3,3,3,3])
  @m14 = Matriz.constructor(3,3, [-1,-1,-1,-1,-1,-1,-1,-1,-1,])
  @m15 = Matriz.constructor(3, 3, [6,6,6,6,6,6,6,6,6])
  
      
  #Dispersas
  
  @m21 = Matriz.constructor(3, 3, [1,0,0,0,0,0,1,0,0])
  @m22 = Matriz.constructor(3, 3, [2,2,0,0,0,0,0,0,2])
  @m23 = Matriz.constructor(3, 3, [3,2,0,0,0,0,1,0,2])
  @m24 = Matriz.constructor(3, 3, [-1,-2,0,0,0,0,1,0,-2])
  @m25 = Matriz.constructor(3, 3, [2,2,0,0,0,0,2,2,0])
   #"Hibridas"
  @m31 = Matriz.constructor(3, 3, [3,3,1,1,1,1,1,1,3])
  @m32 = Matriz.constructor(3, 3, [-1,-1,1,1,1,1,1,1,-1])
  @m33 = Matriz.constructor(3, 3, [2,2,2,2,2,2,2,2,2])
  
  #Maximo y minimo
  @m41 = Matriz.constructor(3,3, [8,5,3,6,6,8,2,3,5,1])
  @m42 = Matriz.constructor(3,3, [0,0,0,0,0,0,0,-7,0,0])
  
  #Con fracciones
  @m51 = Matriz.constructor(3, 3, [@f1,@f1,@f1,@f1,@f1,@f1,@f1,@f1,@f1])
  @m52 = Matriz.constructor(3, 3, [@f2,@f2,@f2,@f2,@f2,@f2,@f2,@f2,@f2])
  @m53 = Matriz.constructor(3, 3, [@f3,@f3,@f3,@f3,@f3,@f3,@f3,@f3,@f3])
  
  #numero + fraccion
  @m61 = Matriz.constructor(2, 2, [3,4,5,6])
  @m62 = Matriz.constructor(2, 2, [@f1,0,0,0])
  @m63 = Matriz.constructor(2, 2, [@f5,4,5,6])

end  
#Operaciones Densa con Densa
  it "La suma de la matriz a y b deberia ser c " do
  
     (@m11+@m12).should == @m13
     
  end
  it "La resta de la matriz a y b deberia ser d " do
  
     (@m11-@m12).should == @m14
     
  end
  it "La multiplicacion de la matriz a y b deberia ser c " do
  
     (@m11*@m12).should == @m15
     
  end


  
#Operaciones Dispersa con Dispersa
  
  it "La suma de la matriz a y b deberia ser c " do
  
     (@m21+@m22).should == @m23
     
  end
  it "La resta de la matriz a y b deberia ser d " do
  
     (@m21-@m22).should == @m24
     
  end
  it "La multiplicacion de la matriz a y b deberia ser c " do
  
     (@m21*@m22).should == @m25
     
  end
  
  #Operaciones Dispersa con Densas
  
  it "La suma de la matriz a(Densa) con b(Dispersa) deberia ser C(Densa) " do
    (@m11+@m22).should == @m31
  end
  it "La resta de la matriz a(Densa) con b(Dispersa) deberia ser C(Densa) " do
    (@m11-@m22).should == @m32
  end
  
  it "La multiplicacion de la matriz a(Densa) con b(Dispersa) deberia ser C(Densa) " do
    
    (@m11*@m22).should == @m33
    
  end
  
  #Comprobación de máximo y mínimo
  
  it "El máximo de la matriz a(Densa) debería ser 8" do
    
    @m41.max.should equal(8)
    
  end
  
    it "El máximo de la matriz a(Densa) debería ser 8" do
      
    @m42.min.should equal(-7)
    
    end
    
    #Operando con fracciones
    it "Operando con fracciones la matriz a + la matriz b debe ser c" do
      (@m51+@m52).should == @m53
  end
  
  it "La suma de un numero y una fraccion deberia ser : " do
    (@m61+@m62).should == @m63
  end

describe "pruebas con dsl" do
                
                it " suma" do
                        @sum = MatrizDSL.new("suma") do
                                operando(2,2,[1,1,2,2])
                                operando(2,2,[2,2,4,4])
                        end
                        @sum.run.should==('[[3,3],[6,6]]')

                        
                        @sumdisp = MatrizDSL.new("suma") do
                                operando(3,3,[0,0,0,0,0,1,0,0,0])
                                operando(3,3,[0,0,0,0,0,1,0,0,0])
                        end
                        @sumdisp.run.should==('[[0,0,0],[0,0,2],[0,0,0]]')

                end
                
                

                it "resta" do
                        @res = MatrizDSL.new("resta") do
                                operando(2,2,[2,2,4,4])
                                operando(2,2,[1,1,2,2])

                        end
                        @res.run.should==('[[1,1],[2,2]]')

                        @resdisp = MatrizDSL.new("resta") do
                                operando(3,3,[0,0,0,0,0,7,0,0,0])
                                operando(3,3,[0,0,0,0,0,1,0,0,0])
                        end
                        @resdisp.run.should==('[[0,0,0],[0,0,6],[0,0,0]]')
                end

                it "producto" do
                        @producto = MatrizDSL.new("producto") do
                                operando(3,3,[1,1,1,1,1,1,1,1,1])
                                operando(3,3,[2,2,2,2,2,2,2,2,2])
                                salida "console"
                        end
                        @producto.run.should==('[[6,6,6],[6,6,6],[6,6,6]]')

                        @productodisp = MatrizDSL.new("producto") do
                                operando(3,3,[0,1,2,1,0,0,0,0,0])
                                operando(3,3,[2,0,2,2,0,0,0,0,0])
                                salida "fichero"
                        end
                        @productodisp.run
                end


        end
end
