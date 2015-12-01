class Host < ActiveRecord::Base
  belongs_to :account
  has_many :tags
  has_many :loadavgs
  has_many :cputimes
  validates :signature, presence: true, uniqueness: true

  def collect_loadavg(data)
    response_hash = {}
    ids = []
    errors = []
    err_ids = []
    if _load = data.fetch(:loadavg)
      _load.each do |l|
        loadid = l.fetch(:loadid)
        dt = Time.at (l.fetch(:dt).to_i )
        l1 = l.fetch(:load1)
        l5 = l.fetch(:load5)
        l15 = l.fetch(:load15)
        sig = l.fetch(:host_sig)
        host = self
        if sig != self.signature
          host = Host.find_by_signature(sig)
        end
        new_loadavg = host.loadavgs.create ({dt: dt, load1: l1, load5: l5, load15: l15})
        if new_loadavg.valid?
          ids << loadid
        else
          errors << new_loadavg.errors
          err_ids << loadid
        end
      end
      response_hash = {
          successful_ids: ids,
          error_msgs: errors,
          error_ids: err_ids
      }
    end
    return response_hash
  end

  def collect_cputimes(data)
    response_hash = {}
    ids = []
    errors=[]
    err_ids = []
    if _cputime = data.fetch(:cputime)
      _cputime.each do |c|
        cputid = c.fetch(:cputid)
        dt = Time.at( c.fetch(:dt).to_i )
        cpuname = c.fetch(:cpuname)
        user = c.fetch(:user)
        sys = c.fetch(:sys)
        idle = c.fetch(:idle)
        nice = c.fetch(:nice)
        iowait = c.fetch(:iowait)
        irq = c.fetch(:irq)
        softirq = c.fetch(:softirq)
        steal = c.fetch(:steal)
        guest = c.fetch(:guest)
        guest_nice = c.fetch(:guest_nice)
        stolen = c.fetch(:stolen)

        sig = c.fetch(:host_sig)
        host = self
        if sig != self.signature
          host = Host.find_by_signature(sig)
        end
        new_cputime = host.cputimes.create ({
                                               dt: dt, cpuname: cpuname, user: user, sys: sys,
                                               idle: idle, nice: nice, iowait: iowait, irq: irq,
                                               softirq: softirq, steal: steal, guest: guest,
                                               guest_nice: guest_nice, stolen: stolen
                                           })
        if new_cputime.valid?
          ids << cputid
        else
          errors << new_cputime.errors
          err_ids << loadid
        end
      end
      response_hash={
          successful_ids: ids,
          error_msgs: errors,
          error_ids: err_ids
      }
    end
    return response_hash
  end

end
