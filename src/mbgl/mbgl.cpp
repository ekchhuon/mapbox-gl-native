#include <mbgl/mbgl.hpp>

#include <mbgl/util/thread_pool.hpp>

#include <cassert>
#include <limits>
#include <memory>
#include <thread>

namespace {

unsigned initCount;

#if !NDEBUG
std::thread::id tid;
#endif

} // namespace

namespace mbgl {

extern std::unique_ptr<ThreadPool> g_backgroundScheduler;

void Init() {
    assert(initCount < std::numeric_limits<unsigned>::max());

    if (initCount++) {
        return;
    }

    assert(tid == std::thread::id());
    assert(!g_backgroundScheduler);

#if !NDEBUG
    tid = std::this_thread::get_id();
#endif

    g_backgroundScheduler = std::make_unique<ThreadPool>(4);
}

void Cleanup() {
    assert(initCount > std::numeric_limits<unsigned>::min());

    if (--initCount) {
        return;
    }

    assert(tid == std::this_thread::get_id());
    assert(g_backgroundScheduler);

#if !NDEBUG
    tid = std::thread::id();
#endif

    g_backgroundScheduler.reset();
}

} // namespace mbgl