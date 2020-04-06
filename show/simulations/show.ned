//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package show.simulations;

//
// TODO auto-generated type
//
simple show
{
	parameters:
	    @signal[arrival](type="long");
	    @statistic[count](title="count"; source="arrival"; record=vector, stats; interpolationmode=none);
	    @display("i=block/routing");

    gates:
        inout gate[];
}

network Show
{
    parameters:
        int nodeNum = 15; // basic simulation is 15 nodes, you can change this number which you want, like 51, 101 or more. 

    types:
        channel Channel extends ned.DelayChannel {
            delay = 3000ms;
        }

    submodules:
        t[nodeNum]: show;

    connections:
        // simplified the code
        for i=0..nodeNum-1, for j=0..nodeNum-1 {
            t[i].gate++ <--> Channel <--> t[j].gate++ if i!=j;
        }
        
        
     	
}
