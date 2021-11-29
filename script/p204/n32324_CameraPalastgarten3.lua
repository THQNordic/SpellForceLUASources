-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 223.482941 , 474.574341 , 51.934898 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9965);]] )
   Camera:MotionSpline_AddSplinePoint( 223.290039 , 475.555573 , 51.934898 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 224.081116 , 476.533264 , 51.934898 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 226.016251 , 480.089661 , 51.934898 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
