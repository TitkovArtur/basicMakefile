#include <iostream>
#include <math.h>

#include "tree.h"
#include "def.h"
#include "boost/compressed_pair.hpp"
int sayHello();

//template <
//    class result_t   = std::chrono::milliseconds,
//    class clock_t    = std::chrono::steady_clock,
//    class duration_t = std::chrono::milliseconds
//>
//std::chrono::duration_cast<result_t> since(std::chrono::time_point<clock_t, duration_t> const& start){
//    return std::chrono::duration_cast<result_t>(clock_t::now() - start);
//}


int main(){
	//std::cout << sayHello()<<"\n";
	//std::cout << sqrt(10) << "\n";
    //tree tmp = tree();
    
    int counter = 0;
//    auto start = std::chrono::steady_clock::now();
    for(int i = 0; i < 10000000; i++){
        counter++;
    }
    //auto end = std::chrono::steady_clock::now();
    std::cout << CONST * counter << std::endl;
//    std::cout << "Elapsed(ms)=" << since(start).count() << std::endl;
    //std::cout << end - start;
    
    
    
	return 0;
}
