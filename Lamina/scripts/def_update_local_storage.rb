
def update_local_storage(cach_path, port)
   if Dir.exists? "#{cache_path}/Local Storage"
     Dir.chdir "#{cache_path}/Local Storage" do
       Dir.entries('.').each do |f| 
         if m = f.match(/^http_localhost_([0-9]*).localstorage/i)
           File.rename f, f.sub(/localhost_([0-9]*)/, "localhost_#{port}") 
         end 
       end 
     end
   end
end
