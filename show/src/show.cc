/*
 * show.cc
 *
 *  Created on: 2020Äê3ÔÂ30ÈÕ
 *  Updated on: 2020.03.31 17:30
 *      Author: hyenas
 */

#include <stdio.h>
#include <string.h>
#include <omnetpp.h>
#include "show_m.h"
using namespace omnetpp;


class show : public cSimpleModule
{
protected:
    virtual Show *generateMessage();
    virtual void forwardMessage(Show *msg);
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(show);



void show::initialize()
{
    if (getIndex() == 0) {
        Show *msg = generateMessage();
        scheduleAt(0.0, msg);
    }
}

void show::handleMessage(cMessage *msg)
{
    Show *s_msg = check_and_cast<Show *>(msg);
    if (s_msg->getDestination() == getIndex()) {
        EV << "Message arrived!";
        bubble("Synced!");
        delete s_msg;

        EV << "Generating other msg: ";
        Show *n_msg = generateMessage();
        EV << n_msg << endl;
        forwardMessage(n_msg);
    } else {
        forwardMessage(s_msg);
    }
    /*
    if (getIndex() == 6) {
           EV << "Synced!\n";
           delete msg;
    } else {
           forwardMessage(msg);
    }*/
}

Show *show::generateMessage() {
    int src = getIndex();
    int n = getVectorSize();
    int dest = intuniform(0, n-2);
    if (dest >= src) dest++;
    char msgname[20];
    sprintf(msgname, "node:%d->%d", src, dest);

    Show *msg = new Show(msgname);
    msg->setSource(src);
    msg->setDestination(dest);
    return msg;
}

void show::forwardMessage(Show *msg) {
    int n = gateSize("gate");
    int k = intuniform(0, n-1);
    EV << "Forwarding message " << msg << " on port gate[" << k << "]\n";
    send(msg, "gate$o", k);
}
