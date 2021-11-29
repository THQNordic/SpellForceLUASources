-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 420.418793 , 168.642548 , 19.747131 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(7011);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 420.052094 , 167.256226 , 18.697130 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 419.683075 , 165.861084 , 17.707130 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 419.315582 , 164.471786 , 16.717131 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
