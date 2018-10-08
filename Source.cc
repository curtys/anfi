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

#include "Source.h"

namespace ainf {

Define_Module(Source);

void Source::initialize()
{
    sendMessageEvent = new cPacket("sendMessageEvent");
    scheduleAt(simTime(), sendMessageEvent);
}

void Source::handleMessage(cMessage *msg)
{
    ASSERT(msg == sendMessageEvent);

    cPacket *job = new cPacket("job");
    send(job, "out");

    scheduleAt(simTime()+par("sendIaTime").doubleValue(), sendMessageEvent);
}

} //namespace
