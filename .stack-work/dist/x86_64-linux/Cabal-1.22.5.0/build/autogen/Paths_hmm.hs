module Paths_hmm (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,3] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/ancieque/hmm/.stack-work/install/x86_64-linux/lts-6.1/7.10.3/bin"
libdir     = "/home/ancieque/hmm/.stack-work/install/x86_64-linux/lts-6.1/7.10.3/lib/x86_64-linux-ghc-7.10.3/hmm-0.3-Ev3X0jeKFBs9YlCjXtVYTN"
datadir    = "/home/ancieque/hmm/.stack-work/install/x86_64-linux/lts-6.1/7.10.3/share/x86_64-linux-ghc-7.10.3/hmm-0.3"
libexecdir = "/home/ancieque/hmm/.stack-work/install/x86_64-linux/lts-6.1/7.10.3/libexec"
sysconfdir = "/home/ancieque/hmm/.stack-work/install/x86_64-linux/lts-6.1/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hmm_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hmm_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hmm_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hmm_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hmm_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
