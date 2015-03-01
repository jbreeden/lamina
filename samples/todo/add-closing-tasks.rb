require_relative "../../lib/ipc"

story = ARGV[0] || "Current Story"

proc_info = eval(File.read("#{File.dirname(__FILE__)}/.rbchromedata"))
browser = IPC.get_proc(proc_info[:browser_ipc_port])

browser.execute_javascript script: <<EOF
  (function () {
    var model = document.getElementById('model')
    var count = 0;

    var steps = [
      '#{story}: Add closing notes',
      '#{story}: Fill in the actual hours',
      '#{story}: Mark all tasks complete',
      '#{story}: Mark user story complete'
    ];

    var interval = setInterval(function () {
      model.newItem(steps.shift());
      if(steps.length == 0) clearInterval(interval);
    }, 400);
  }());
EOF
