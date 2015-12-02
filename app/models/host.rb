class Host < ActiveRecord::Base
  belongs_to :account
  has_many :tags
  has_many :loadavgs
  has_many :cputimes
  has_many :virtualmems
  has_many :swapmems
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
          err_ids << cputid
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

  def collect_virtualmem(data)
    response_hash = {}
    ids = []
    errors = []
    err_ids = []
    if _vm = data.fetch(:virtualmem)
      _vm.each do |v|
        _vmid = v.fetch(:vmid)
        dt = Time.at (v.fetch(:dt).to_i )
        total = v.fetch(:total)
        available = v.fetch(:available)
        used = v.fetch(:used)
        usedpercent = v.fetch(:usedpercent)
        free = v.fetch(:free)
        active = v.fetch(:active)
        inactive = v.fetch(:inactive)
        buffers = v.fetch(:buffers)
        cached = v.fetch(:cached)
        wired = v.fetch(:wired)
        shared = v.fetch(:shared)

        host = self
        sig = v.fetch(:host_sig)
        if sig != self.signature
          host = Host.find_by_signature(sig)
        end
        new_vm = host.virtualmems.create ({
                                            dt: dt,
                                            total: total,
                                            available: available,
                                            used: used,
                                            usedpercent: usedpercent,
                                            free: free,
                                            active: active,
                                            inactive: inactive,
                                            buffers: buffers,
                                            cached: cached,
                                            wired: wired,
                                            shared: shared })
        if new_vm.valid?
          ids << _vmid
        else
          errors << new_vm.errors
          err_ids << _vmid
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

  def collect_swapmem(data)
    response_hash = {}
    ids = []
    errors = []
    err_ids = []
    if _sp = data.fetch(:swapmem)
      _sp.each do |s|
        _spid = s.fetch(:swapid)
        dt = Time.at (s.fetch(:dt).to_i )
        total = s.fetch(:total)
        used = s.fetch(:used)
        usedpercent = s.fetch(:usedpercent)
        free = s.fetch(:free)
        sin = s.fetch(:sin)
        sout = s.fetch(:sout)

        host = self
        sig = s.fetch(:host_sig)
        if sig != self.signature
          host = Host.find_by_signature(sig)
        end
        new_sp = host.swapmems.create ({
                                            dt: dt,
                                            total: total,
                                            used: used,
                                            usedpercent: usedpercent,
                                            free: free,
                                            sin: sin,
                                            sout: sout })
        if new_sp.valid?
          ids << _spid
        else
          errors << new_sp.errors
          err_ids << _spid
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

end
