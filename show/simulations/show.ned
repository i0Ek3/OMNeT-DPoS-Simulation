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
        int nodeNum = 6; // basic simulation is 15 nodes. 

    types:
        channel Channel extends ned.DelayChannel {
            delay = 1000ms;
        }

    submodules:
        t[nodeNum]: show;

    connections:
        // cause of the gate have bi-direction, so we shouldn't use 2->4 and 4->2 every time, we just use 2->4 or 4->2.
        
        for i=1..5 {
        	t[0].gate++ <--> Channel <--> t[i].gate++;
        }

        for i=2..5 {
            t[1].gate++ <--> Channel <--> t[i].gate++;
        }

        for i=3..5 {
        	t[2].gate++ <--> Channel <--> t[i].gate++;
        }
     
        for i=4..5 {
        	t[3].gate++ <--> Channel <--> t[i].gate++;
        }
        
        t[4].gate++ <--> Channel <--> t[5].gate++;

}
