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

#ifndef __ANFI_SERVER_H_
#define __ANFI_SERVER_H_

#include <omnetpp.h>
#include "IServer.h"
#include "Job.h"

using namespace omnetpp;

namespace anfi {

class SelectionStrategy;

class Server : public cSimpleModule, public queueing::IServer
{
private:
       simsignal_t busySignal;
       bool allocated;

       SelectionStrategy *selectionStrategy;

       queueing::Job *jobServiced;
       cMessage *endServiceMsg;

   public:
       Server();
       virtual ~Server();

   protected:
       virtual void initialize() override;
       virtual int numInitStages() const override {return 2;}
       virtual void handleMessage(cMessage *msg) override;
       virtual void refreshDisplay() const override;
       virtual void finish() override;

   public:
       virtual bool isIdle() override;
       virtual void allocate() override;
};

}; //namespace

#endif
