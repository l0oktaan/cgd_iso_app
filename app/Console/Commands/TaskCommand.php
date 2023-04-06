<?php

namespace App\Console\Commands;

use Carbon\Carbon;
use App\Models\RequestForm;
use Illuminate\Console\Command;
use App\Http\Controllers\LineBotController;

class TaskCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cron:alertExpire';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    private function CheckNowExpireRequestForm(){
        $line_bot = new LineBotController;
        $checkDate = Carbon::today();
        $request_forms = RequestForm::where("alert_expire",1)
            ->where("end_date",$checkDate)->get();
        foreach ($request_forms as $request_form) {
            $line_bot->multiCast($request_form->group_id,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> หมดอายุในวันนี้ ". $checkDate->format('d/m/Y'));

            $request_form->save();
        }
    }
    private function CheckCloseExpireRequestForm(){
        $line_bot = new LineBotController;
        $checkDate = Carbon::today()->addDays(3);
        $request_forms = RequestForm::where("alert_expire",1)
            ->where("end_date",$checkDate)->get();
        foreach ($request_forms as $request_form) {
            $line_bot->multiCast($request_form->group_id,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> กำลังจะหมดอายุในวันที่ ". $checkDate->format('d/m/Y'));

            $request_form->save();
        }
    }
    public function handle()
    {
        $this->CheckCloseExpireRequestForm();
        $this->CheckNowExpireRequestForm();
        // RequestForm::where('id','>',1)->update(['alert_expire' => 1]);
    }
}
