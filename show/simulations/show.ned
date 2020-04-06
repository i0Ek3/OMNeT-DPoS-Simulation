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
        int nodeNum = 15; // basic simulation is 15 nodes. 

    types:
        channel Channel extends ned.DelayChannel {
            delay = 1000ms;
        }

    submodules:
        t[nodeNum]: show;

    connections:
        // cause of the gate have bi-direction, so we shouldn't use 2->4 and 4->2 every time, we just use 2->4 or 4->2 once.
        
        for i=1..14 {
        	t[0].gate++ <--> Channel <--> t[i].gate++;
        }

        for i=2..14 {
            t[1].gate++ <--> Channel <--> t[i].gate++;
        }

        for i=3..14 {
        	t[2].gate++ <--> Channel <--> t[i].gate++;
        }
     
        for i=4..14 {
        	t[3].gate++ <--> Channel <--> t[i].gate++;
        }
        
        for i=5..14 {
        	t[4].gate++ <--> Channel <--> t[i].gate++;
        }
        
        for i=6..14 {
        	t[5].gate++ <--> Channel <--> t[i].gate++;
        }
        
        for i=7..14 {
        	t[6].gate++ <--> Channel <--> t[i].gate++;
        }
        
        for i=8..14 {
        	t[7].gate++ <--> Channel <--> t[i].gate++;
        }
        
        for i=9..14 {
        	t[8].gate++ <--> Channel <--> t[i].gate++;
        }
        
        for i=10..14 {
        	t[9].gate++ <--> Channel <--> t[i].gate++;
        }
        
        for i=11..14 {
        	t[10].gate++ <--> Channel <--> t[i].gate++;
        }
        
        for i=12..14 {
        	t[11].gate++ <--> Channel <--> t[i].gate++;
        }
        
        for i=13..14 {
        	t[12].gate++ <--> Channel <--> t[i].gate++;
        }

        t[13].gate++ <--> Channel <--> t[14].gate++;

}
