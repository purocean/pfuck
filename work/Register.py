# coding: utf-8

import work.Work
import time

class Register(work.Work.Work):

    def __init__(self, workId, phoneNum):
        super(Register, self).__init__(workId);

        self.phoneNum = phoneNum

    def run(self):
        for x in range(50):
            if self.checkRun():
                break

            time.sleep(1)
            self.log(self.phoneNum)
