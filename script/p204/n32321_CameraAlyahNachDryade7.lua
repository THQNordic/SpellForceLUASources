-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 235.321213 , 284.458649 , 22.204296 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9877);]] )
   Camera:MotionSpline_AddSplinePoint( 231.321335 , 284.491241 , 22.204296 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 227.313293 , 283.523865 , 22.204296 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 223.288925 , 280.556549 , 22.204296 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
