-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 238.511948 , 274.009338 , 20.415213 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8787);]] )
   Camera:MotionSpline_AddSplinePoint( 238.450775 , 275.007477 , 20.415213 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 238.389618 , 276.005615 , 20.415213 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 236.209900 , 278.877716 , 20.415213 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
